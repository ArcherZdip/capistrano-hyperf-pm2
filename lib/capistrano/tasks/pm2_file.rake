namespace :load do
    task :defaults do
        set :pm2_upload_main_file_on_deploy, true
        set :pm2_main_file, 'main.js'
        set :pm2_file_roles, :all
    end
end

namespace :pm2 do
    desc 'Upload pm2 main.js file for release.'
    task :upload_pm2_main do
        next unless fetch(:pm2_upload_main_file_on_deploy)

        main_file = fetch(:pm2_main_file)

        run_locally do
            if main_file.empty? || test("[ ! -e #{main_file} ]")
                raise Capistrano::ValidationError,
                    "Must prepare main file [#{main_file}] locally before use pm2!"
            end
        end

        on roles fetch(:pm2_file_roles) do
            upload! main_file, "#{release_path}/#{main_file}"
        end
    end
end
