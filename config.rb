require 'susy'
require 'modular-scale'
require 'bourbon'

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript, inline: true

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :i18n, mount_at_root: :nl
activate :directory_indexes
activate :sprockets

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'grupodelsur' # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                     = 'eu-west-1'     # The AWS region for your bucket.
end

default_caching_policy max_age:(60 * 60 * 24 * 365) # https://github.com/fredjean/middleman-s3_sync#setting-a-default-policy

activate :autoprefixer do |config|
    config.browsers = ['last 2 versions', 'Explorer >= 9']
end

# https://github.com/middleman-contrib/middleman-dotenv
# Dotenv for Middleman
# Loads environment variables from `.env`
#
# Activate before using any ENV defined in `.env`
activate :dotenv

activate :contentful do |f|
  f.space         = { website: 'y39ktgmrw5l4' }
  f.access_token  = ENV['GRUPO_DEL_SUR_WEBSITE_ACCESS_TOKEN']
  f.cda_query     = { limit: 1000 }
  f.content_types = {
    musicians: 'musicians',
    pages:     'pages'
  }
end
