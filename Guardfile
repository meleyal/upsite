guard :livereload do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|lib|vendor)(/assets/\w+/(.+\.(css|js))).*}) { |m| "/assets/#{m[3]}" }
  # also watch just .scss + .coffee
  watch(%r{(app|vendor)(/assets/\w+/(.+)\.(scss))}) { |m| "/assets/#{m[3]}.css" }
  watch(%r{(app|vendor)(/assets/\w+/(.+)\.(coffee))}) { |m| "/assets/#{m[3]}.js" }
end
