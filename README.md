# favouriteLanguage
Determine a Github user's favourite language.


Issues faced when setting up

- Bundle install gives this error:
Bundler::Fetcher::CertificateFailureError Could not verify the SSL certificate for https://rubygems.org/.
There is a chance you are experiencing a man-in-the-middle attack, but most likely your system doesn't have the CA certificates needed for verification. For information about OpenSSL certificates, see http://bit.ly/ruby-ssl. To connect without using SSL, edit your Gemfile sources and change 'https' to 'http'.

-- Solution
  - This is caused by missing certificates. `http://railsapps.github.io/openssl-certificate-verify-failed.html` contains guidance on getting past this for different operating systems.
    For windows (alternatively, follow this: `https://gist.github.com/fnichol/867550`):
        - Download the file at `http://curl.haxx.se/ca/cacert.pem` and save at `C:\RailsInstaller\cacert.pem`
        - Go to Control Panel -> Find the setting labelled 'Edit the system environment variables'
        - Click 'Environment Variables'
        - Add a New User Variable called 'SSL_CERT_FILE' with value 'C:\RailsInstaller\cacert.pem` (As opposed to setting as in the tutorial as this will leave it as a permanent variable)

