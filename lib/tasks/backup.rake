namespace :backup do
  desc 'Make a JSON dump of all models in /tmp/backup/'
  task dump: :environment do
    FileUtils.mkdir_p 'tmp/backup'

    models.each do |model|
      File.open "tmp/backup/#{model.table_name}.json", 'w' do |file|
        model.unscoped.each { |o| file << "#{o.to_json}\n" }
      end
    end
  end

  desc 'Read all models JSON from /tmp/backup and copy that into de database'
  task restore: :environment do
    ActiveRecord::Base.transaction do
      Rake::Task['backup:clean'].invoke

      PaperTrail.enabled = false

      models.each do |model|
        File.open "tmp/backup/#{model.table_name}.json", 'r' do |file|
          file.each_line do |json_line|
            o = model.unscoped.new
            o.from_json json_line
            o.save! validate: false
          end
        end
      end

      raise 'Error!!!' unless models.all? { |m| m.unscoped.all?(&:valid?) }
    end
  end

  desc 'Remove all data from the database'
  task clean: :environment do
    models.each { |m| m.unscoped.delete_all }
  end

  private

    def models
      [
        Account,
        Book,
        City,
        Commodity,
        Customer,
        Entity,
        InvoiceCommodity,
        Invoice,
        Item,
        Organization,
        PaperTrail::Version,
        Provider,
        PurchaseCommodity,
        Purchase,
        ReceiptCommodity,
        Receipt,
        Relation,
        Service,
        State,
        Supply,
        User,
        Warehouse,
      ]
    end
end