// Publishes docs.dynart.net when docs-public changes.
//
// The site is dpress with the Docs plugin, not a Sphinx build any more: nothing is built here and
// nothing is copied to the server. The server pulls docs-public itself and rebuilds the pages -
// `dpress docs:build`, with "Update" ticked under Settings > Documentation - so this job only
// tells it to, and fails if it could not.
//
// Never rsync or delete anything under /var/www/docs.dynart.net: that folder is the dpress
// install (its code, dpress.ini, logs), and the old Deploy stage replaced it with Sphinx's HTML.

pipeline {
    agent any

    stages {
        // Kept for the trigger alone: a push to docs-public starts the jobs that check it out, so
        // without this checkout the webhook would no longer start this one. Nothing here reads
        // the files - the submodules are not fetched, and there is no build in the workspace.
        stage('Checkout') {
            steps {
                checkout scmGit(
                    branches: [[name: 'main']],
                    userRemoteConfigs: [[
                        url: 'git@github.com:DynartInteractive/docs-public.git',
                        credentialsId: '14f93b84-31b0-4817-af34-699b52f5e228'
                    ]]
                )
            }
        }
        stage('Publish') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'server-key', keyFileVariable: 'SSH_KEY')]) {
                    // As www-data, not root: the build writes the site's database and pulls
                    // /var/www/docs-public, which www-data owns so the Build button can too.
                    // From the site's folder: `dpress` finds its dpress.ini by looking up from where
                    // it is run, and over ssh that is /root - which www-data cannot even read.
                    //
                    // Red when nothing was built (docs:build exits 1), and red when the pull on the
                    // server failed - dpress still builds then, from the source it already had, so
                    // the site stays up, but the change that started this job is not on it.
                    sh '''
                        set -eu
                        out=$(ssh -i "$SSH_KEY" -o StrictHostKeyChecking=no root@dynart.net \
                            "cd /var/www/docs.dynart.net && runuser -u www-data -- vendor/bin/dpress docs:build" 2>&1) \
                            || { echo "$out"; exit 1; }
                        echo "$out"
                        if echo "$out" | grep -q "The source was not updated"; then
                            echo "The pull on the server failed: the pages were rebuilt from the source it already had."
                            exit 1
                        fi
                    '''
                }
            }
        }
    }
}
