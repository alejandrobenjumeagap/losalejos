
namespace :db do
  desc "Deleted all DB info"
  task clean: :environment do
    [
      User, Invite
    ].each do |model|
      model.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
    end
  end
end
