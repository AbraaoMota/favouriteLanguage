# favouriteLanguage
## Determine a Github user's favourite language.

### Installation

Make sure you have Ruby and Ruby on Rails installed.
This was created on Ruby version 2.2.4 and Rails 4.2.5.1
Once you clone the repo, run `bundle install`, and this should install any dependencies required to set up the project.
To prepare the database, run `rake db:migrate`; this prepares it for the development environment.

### Usage

Run `rails s` to start the local server, and access the webpage at "http://localhost:3000"

To run the test suite, you may be required to run `rake db:migrate RAILS_ENV=test` to prepare the test database for the first time.
Run `bin/test` to run the entire testsuite.
The test suite is made up of:
  - Rubocop Ruby standard checks
  - Unit tests by Minitest
  - Acceptance tests by Cucumber

This is designed to run sequentially, such that it will not complete execution if any of the above fail.


### Issues faced when setting up

- Due to an ongoing bug using Cucumber and RSpec in windows, I had to use Minitest.

- Bundle install gives this error:
  `Bundler::Fetcher::CertificateFailureError Could not verify the SSL certificate for https://rubygems.org/. There is a chance you are experiencing a man-in-the-middle attack, but most likely your system doesn't have the CA certificates needed for verification. For information about OpenSSL certificates, see http://bit.ly/ruby-ssl. To connect without using SSL, edit your Gemfile sources and change 'https' to 'http'.`

  **Solution**
  

  This is caused by missing certificates. http://railsapps.github.io/openssl-certificate-verify-failed.html contains guidance on getting past this for different operating systems.

  For windows (alternatively, follow this: https://gist.github.com/fnichol/867550):
  - Download the file at http://curl.haxx.se/ca/cacert.pem and save at `C:\RailsInstaller\cacert.pem`
  - Go to Control Panel -> Find the setting labelled 'Edit the system environment variables'
  - Click 'Environment Variables'
  - Add a New User Variable called 'SSL_CERT_FILE' with value 'C:\RailsInstaller\cacert.pem` (As opposed to setting as in the tutorial as this will leave it as a permanent variable)
