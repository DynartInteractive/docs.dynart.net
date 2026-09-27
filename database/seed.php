<?php

/**
 * Fills a freshly installed database with the example data
 *
 * Goes through the services rather than writing rows, so the events fire and the audit trail
 * looks like a real site's - which is the point of having example data at all.
 *
 *   php database/seed.php
 *
 * `database/reset.sh` (or reset.bat) drops the database, installs, seeds, and dumps the result
 * to example-data.sql. Regenerate that file whenever the entities change; there is no rename
 * migration before 1.0.
 */

use Dynart\Micro\Micro;
use Dynart\Micro\Entities\AuditService;
use Dynart\Dpress\DpressCliApp;
use Dynart\Dpress\Entity\Content;
use Dynart\Dpress\Entity\Media;
use Dynart\Dpress\Entity\Role;
use Dynart\Dpress\Entity\User;
use Dynart\Dpress\Service\ContentService;
use Dynart\Dpress\Service\MediaService;
use Dynart\Dpress\Service\MenuService;
use Dynart\Dpress\Service\SettingService;
use Dynart\Dpress\Service\TaxonomyService;
use Dynart\Dpress\Service\UserService;

require_once __DIR__ . '/../vendor/autoload.php';

$app = new DpressCliApp([__DIR__ . '/../dpress.ini']);
$app->fullInit();

$users = Micro::get(UserService::class);
$content = Micro::get(ContentService::class);
$audit = Micro::get(AuditService::class);
$taxonomy = Micro::get(TaxonomyService::class);
$media = Micro::get(MediaService::class);
$menus = Micro::get(MenuService::class);
$blocks = Micro::get(\Dynart\Dpress\Service\BlockService::class);
$settings = Micro::get(SettingService::class);

echo "Seeding example data\n";

// --- Users -------------------------------------------------------------------------------

$admin = $users->findByEmail('admin@example.com')
    ?? $users->create('admin@example.com', 'admin12345', 'Site Admin', [Role::NAME_ADMIN]);
echo "  user  admin@example.com   / admin12345   (admin)\n";

$editor = $users->findByEmail('editor@example.com')
    ?? $users->create('editor@example.com', 'editor12345', 'Edit Everything', [Role::NAME_EDITOR]);
echo "  user  editor@example.com  / editor12345  (editor)\n";

$reader = $users->findByEmail('reader@example.com')
    ?? $users->create('reader@example.com', 'reader12345', 'Ray Reader', [Role::NAME_READER]);
echo "  user  reader@example.com  / reader12345  (reader)\n";

$pending = $users->findByEmail('pending@example.com')
    ?? $users->create('pending@example.com', 'pending12345', 'Penny Pending', [Role::NAME_READER], User::STATUS_PENDING);
echo "  user  pending@example.com / pending12345 (reader, pending - cannot log in)\n";

// --- Content -----------------------------------------------------------------------------

$posts = [
    [
        'title' => 'Welcome to dpress',
        'author' => $admin,
        'publish' => true,
        // %VIDEO% is filled in after the media is imported, further down: the id of a file only
        // exists once it has been stored, and a shortcode naming the wrong one is worse than none.
        'markdown' => <<<'MD'
This is the lead. Everything before the separator shows up in listings, and only that.

---

## And this is the body

The body is everything after the first line that is nothing but three dashes. A post with no
separator is all lead and no body, which is exactly what a short note is.

%VIDEO%

Markdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).

- a list item
- another one

> A blockquote, for good measure.

> [!WARNING]
> Do not do this on a live site.

> [!DANGER]
> Very dangerous.

> [!INFO]
> The setting is in **Settings → Code theme**.

```php
<?php

class ThisIsATest {

    private int $test = 0;

    public function __construct() {
        $this->test = 1;
    }
}
```
MD
    ],
    [
        'title' => 'Árvíztűrő tükörfúrógép',
        'author' => $editor,
        'publish' => true,
        'markdown' => <<<'MD'
Az ékezetes címekből is olvasható URL lesz, mert a slug az ékezeteket az alapbetűre képezi le.

---

Ez a törzsszöveg. A cím slugja `arvizturo-tukorfurogep` lett, nem pedig kötőjelek sora.
MD
    ],
    [
        'title' => 'A short note',
        'author' => $editor,
        'publish' => true,
        'markdown' => 'No separator here, so the whole thing is the lead and there is no body.',
    ],
    [
        'title' => 'Something unfinished',
        'author' => $admin,
        'publish' => false,
        'markdown' => "A draft. Visitors get a 404; anybody who may edit posts can preview it.\n\n---\n\nStill being written.",
    ],
];

foreach ($posts as $data) {
    if ($content->findBySlug($data['title'], false) !== null) {
        continue;
    }
    $created = $content->create([
        'type'     => Content::TYPE_POST,
        'title'    => $data['title'],
        'markdown' => $data['markdown'],
        'status'   => $data['publish'] ? Content::STATUS_PUBLISHED : Content::STATUS_DRAFT,
    ], $data['author']->id);
    echo "  post  /{$created->slug} ({$created->status})\n";
}

// --- A page, and a child of it -----------------------------------------------------------

$about = $content->findBySlug('about', false);
if ($about === null) {
    $about = $content->create([
        'type'     => Content::TYPE_PAGE,
        'title'    => 'About',
        'markdown' => "About this site.\n\n---\n\nPages are hierarchical. This one has a child.",
        'status'   => Content::STATUS_PUBLISHED,
    ], $admin->id);
    echo "  page  /{$about->slug}\n";
}

if ($content->findBySlug('contact', false) === null) {
    $contact = $content->create([
        'type'      => Content::TYPE_PAGE,
        'title'     => 'Contact',
        'markdown'  => 'How to get in touch.',
        'status'    => Content::STATUS_PUBLISHED,
        'parent_id' => $about->id,
    ], $admin->id);
    echo "  page  /{$about->slug}/{$contact->slug} (child of About)\n";
}

// --- Taxonomy ---------------------------------------------------------------------------

$news = $taxonomy->findCategoryBySlug('news') ?? $taxonomy->createCategory('News');
$guides = $taxonomy->findCategoryBySlug('guides') ?? $taxonomy->createCategory('Guides');
$howTo = $taxonomy->findCategoryBySlug('how-to') ?? $taxonomy->createCategory('How to', ['parent_id' => $guides->id]);
echo "  cat   /news, /guides, /guides > /how-to
";

$welcome = $content->findBySlug('welcome-to-dpress', false);
if ($welcome !== null) {
    $taxonomy->setCategories($welcome->id, [$news->id]);
    // `featured` is what puts a post at the top of the front page - a tag, so featuring one is
    // something an author already knows how to do, and un-featuring is removing it. Which tag is
    // the `featured_tag` setting; this is its default.
    $taxonomy->setTags($welcome->id, ['dpress', 'markdown', 'getting started', 'featured']);
    echo "  tags  /welcome-to-dpress: dpress, markdown, getting started, featured
";
}
$note = $content->findBySlug('a-short-note', false);
if ($note !== null) {
    $taxonomy->setCategories($note->id, [$news->id]);
    $taxonomy->setTags($note->id, ['dpress']);
}
$accented = $content->findBySlug('arvizturo-tukorfurogep', false);
if ($accented !== null) {
    $taxonomy->setCategories($accented->id, [$howTo->id]);
    $taxonomy->setTags($accented->id, ['markdown']);
}

// --- Media ------------------------------------------------------------------------------

$examples = __DIR__ . '/media';
$video = null;
if (is_dir($examples) && $welcome !== null) {
    foreach (glob($examples . '/*') as $file) {
        if ($media->findByPath(basename($file)) !== null) {
            continue;
        }
        $item = $media->importFile($file, $admin->id, ['alt' => 'Example ' . pathinfo($file, PATHINFO_FILENAME)]);
        echo "  media {$item->path} ({$item->category})
";
        if ($item->category === Media::CATEGORY_VIDEO) {
            // embedded in the post rather than attached to it - an attachment is a file somebody
            // attached, and something shown in the body is a reference in the text
            $video = $item;
        } else if ($item->isImage() && $welcome->featured_media_id === null && $item->isResizable()) {
            $content->update($welcome, ['featured_media_id' => $item->id]);
        } else {
            $media->attach($welcome->id, $item->id);
        }
    }
}

// A picture on the other posts too, so a listing has cards rather than a wall of headings. The
// welcome post already took the first one above; these take whatever else the library holds, and
// a post that ends up with none is a post with no picture, which is a case a theme has to handle
// anyway.
$taken = [];
foreach ($content->findAll([]) as $row) {
    if ($row['featured_media_id'] !== null) {
        $taken[(int)$row['featured_media_id']] = true;
    }
}
$pictures = [];
foreach ($media->findAll(['category' => Media::CATEGORY_IMAGE]) as $row) {
    $item = $media->findById((int)$row['id']);
    // not one that is already somebody's picture: the same photo on two cards reads as a bug in
    // the theme rather than as example data. `database/media` holds fewer pictures than there are
    // posts, so some posts end up with none - which is a case a listing has to handle anyway.
    if ($item !== null && $item->isResizable() && !isset($taken[$item->id])) {
        $pictures[] = $item;
    }
}
foreach ([$note, $accented, $about, $content->findBySlug('contact', false)] as $post) {
    if ($post === null || $pictures === []) {
        continue;
    }
    $fresh = $content->findById($post->id);
    if ($fresh !== null && $fresh->featured_media_id === null) {
        $content->update($fresh, ['featured_media_id' => array_shift($pictures)->id]);
    }
}

// Something in the `footer` place, which a theme with a footer draws
if ($blocks->inPlace('footer') === []) {
    $blocks->create('category_list', ['title' => 'Categories', 'place' => 'footer',
        'enabled' => true, 'settings' => []]);
    $blocks->create('markdown', ['title' => 'Support', 'place' => 'footer', 'enabled' => true,
        'settings' => ['markdown' => 'If this was useful, [buy me a coffee](https://ko-fi.com/).']]);
    echo "  block footer: categories and a support note
";
}

// The shortcode can only be written once the file it names has an id, so the placeholder left in
// the welcome post is filled in here. No video in `database/media`, no placeholder either: a demo
// that is missing a file should be missing the video, not showing the token that would have been.
if ($welcome !== null && str_contains((string)$welcome->markdown, '%VIDEO%')) {
    $content->update($welcome, ['markdown' => str_replace(
        $video === null ? "%VIDEO%

" : '%VIDEO%',
        $video === null ? '' : "{{ video('media#{$video->id}') }}",
        (string)$welcome->markdown
    )]);
    echo $video === null
        ? "  post  no video in database/media, so none embedded
"
        : "  post  welcome embeds media#{$video->id}
";
}

// --- Settings and menus -------------------------------------------------------------------

$settings->set(\Dynart\Dpress\Entity\Setting::SITE_NAME, 'dpress dev');
$settings->set(\Dynart\Dpress\Entity\Setting::REGISTRATION_OPEN, '1');

// The files are in public/, and the paths are relative to the site root rather than absolute, so
// they still resolve if this app is served from somewhere other than a subfolder of localhost.
$settings->set(\Dynart\Dpress\Entity\Setting::SITE_LOGO, '/static/dpress-logo.svg');
$settings->set(\Dynart\Dpress\Entity\Setting::SITE_ICON, '/favicon.png');
echo "  set   site_name, registration_open, site_logo, site_icon
";

if ($menus->findMenuByPlace('main') === null) {
    $main = $menus->createMenu('Main', 'main');
    $menus->addItem($main, ['label' => 'Home', 'target_type' => 'home', 'position' => 0]);
    if ($about !== null) {
        $menus->addItem($main, ['label' => 'About', 'target_type' => 'content', 'target_id' => $about->id, 'position' => 1]);
    }
    $menus->addItem($main, ['label' => 'News', 'target_type' => 'category', 'target_id' => $news->id, 'position' => 2]);
    echo "  menu  Main -> place 'main': Home, About, News
";
}

// --- The sidebar ---------------------------------------------------------------------------

// One of each kind, so a fresh development site shows what a place is for rather than describing
// it. They are only added when the sidebar is empty, which is what makes this script safe to run
// twice.
if ($blocks->inPlace('sidebar') === []) {
    $blocks->create('tag_cloud', ['title' => 'Tags', 'place' => 'sidebar', 'enabled' => true,
        'settings' => ['limit' => '20']]);
    $blocks->create('category_list', ['title' => 'Categories', 'place' => 'sidebar', 'enabled' => true,
        'settings' => []]);
    $blocks->create('markdown', ['title' => 'About this site', 'place' => 'sidebar', 'enabled' => true,
        'settings' => ['markdown' => "A **markdown** block: whatever you write, beside the content.

"
            ."It is the same markdown as everywhere else, so `media#12`, [internal links](post#1) and
"
            ."shortcodes all work in here."]]);
    echo "  block sidebar: tag cloud, categories, a markdown block
";
}

// A place the front page renders and nothing else does - which is the whole of "this block only
// shows on the home page", with no visibility rule anywhere. The `plain` theme draws `home_top`
// in `layout-home.phtml` and never mentions it in `layout.phtml`.
if ($blocks->inPlace('home_top') === []) {
    $blocks->create('markdown', ['title' => '', 'place' => 'home_top', 'enabled' => true,
        'settings' => ['markdown' => "Welcome. This block sits in `home_top`, a place only the "
            ."front page's layout renders, so it is on this page and on no other."]]);
    echo "  block home_top: a welcome note the front page alone shows
";
}

// --- A second revision, so the history has something in it --------------------------------

$welcome = $content->findBySlug('welcome-to-dpress', false);
if ($welcome !== null) {
    $audit->reset(); // a new revision, so the edit is its own entry rather than folded into the create
    $audit->setUserId((string)$editor->id);
    $content->update($welcome, ['title' => 'Welcome to dpress!']);
    echo "  edit  /welcome-to-dpress - a second revision, by the editor\n";
}

echo "Done. Try: dpress content:list, dpress content:history -id 1\n";
