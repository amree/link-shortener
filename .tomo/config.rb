plugin "git"
plugin "env"
plugin "bundler"
plugin "rails"
plugin "nodenv"
plugin "puma"
plugin "rbenv"
plugin "sidekiq"
plugin "./plugins/link-shortener.rb"

host "deployer@amree.dev"

set application: "link-shortener"
set deploy_to: "/var/www/%{application}"
set rbenv_ruby_version: "2.6.3"
set nodenv_node_version: "12.14.1"
set nodenv_yarn_version: "1.22.4"
set git_url: "git@gitlab.com:amree/link-shortener.git"
set git_branch: "amree-work"
set git_exclusions: %w[
  .tomo/
  spec/
  test/
]
set env_vars: {
  RACK_ENV: "production",
  RAILS_ENV: "production",
  RAILS_LOG_TO_STDOUT: "1",
  RAILS_SERVE_STATIC_FILES: "1"
}
set linked_dirs: %w[
  log
  node_modules
  public/assets
  public/packs
  tmp/cache
  tmp/pids
  tmp/sockets
]
set linked_files: %w[
  config/credentials/production.key
  GeoLite2-City.mmdb
]
set bundler_version: "2.0.0"

setup do
  run "env:setup"
  run "core:setup_directories"
  run "git:clone"
  run "git:create_release"
  run "core:symlink_shared"
  run "nodenv:install"
  run "rbenv:install"
  run "bundler:upgrade_bundler"
  run "bundler:config"
  run "bundler:install"
  run "rails:db_create"
  run "rails:db_schema_load"
  run "rails:db_seed"
  run "puma:setup_systemd"
  run "sidekiq:setup_systemd"
end

deploy do
  run "env:update"
  run "git:create_release"
  run "core:symlink_shared"
  run "core:write_release_json"
  run "bundler:install"
  run "rails:db_migrate"
  run "rails:db_seed"
  run "rails:assets_precompile"
  run "core:symlink_current"
  run "puma:restart"
  run "puma:check_active"
  run "core:clean_releases"
  run "bundler:clean"
  run "core:log_revision"
  run "sidekiq:restart"
end
