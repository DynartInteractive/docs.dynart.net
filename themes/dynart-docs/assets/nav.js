/* The header panel on a narrow screen.
 *
 * The stylesheet hides the panel only under `.js-nav`, which the head writes inline before the
 * page paints - so a browser that runs no script at all gets the panel open and the button gone,
 * which is a menu somebody can still use rather than one that has quietly disappeared. This file
 * is the behaviour and nothing else, and it is deferred: the class cannot wait for it, the click
 * handler can.
 */
(function () {
    'use strict';

    function ready(fn) {
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', fn);
        } else {
            fn();
        }
    }

    ready(function () {
        var toggle = document.querySelector('.nav-toggle');
        var panel = document.getElementById('site-panel');
        if (!toggle || !panel) {
            return;
        }

        // `aria-expanded` is the state, not a second variable beside it that can drift: a screen
        // reader reads the button out of that attribute, so anything else would be a private
        // truth the page never tells anybody.
        function open(wanted) {
            toggle.setAttribute('aria-expanded', wanted ? 'true' : 'false');
            panel.classList.toggle('is-open', wanted);
        }

        toggle.addEventListener('click', function () {
            open(toggle.getAttribute('aria-expanded') !== 'true');
        });

        // The submenus, opened by the button beside the item that owns them. Delegated, because
        // a menu is whatever somebody has put in it: binding each button would mean knowing
        // how many there are, and a menu edited in the admin can grow one at any time.
        //
        // The button and not the link: a parent item is a page of its own, and a menu that
        // swallows the tap to open a submenu is a page with no way in. On a wide screen the
        // dropdown is CSS and this runs for nothing - the button is `display: none` there.
        panel.addEventListener('click', function (event) {
            var button = event.target.closest('.submenu-toggle');
            if (!button) {
                return;
            }
            var wanted = button.getAttribute('aria-expanded') !== 'true';
            button.setAttribute('aria-expanded', wanted ? 'true' : 'false');
            button.parentNode.classList.toggle('is-open', wanted);
        });

        // Escape closes it and puts the focus back on the button, because the panel is the whole
        // of the screen under the brand and a keyboard has nowhere else to go.
        document.addEventListener('keydown', function (event) {
            if (event.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
                open(false);
                toggle.focus();
            }
        });

        // A wide screen shows all three anyway. Without this the panel comes back *closed* when
        // the window is widened and narrowed again, having been left open on the wide one.
        window.addEventListener('resize', function () {
            if (window.innerWidth >= 780) {
                open(false);
            }
        });
    });
}());
