namespace :nbs do
  namespace :upgrades do

    desc "Merge category suppliers with suppliers"
    task :merge_suppliers => :environment do
      required_updates = 0

      roles = [:category_supplier, :supplier]

      default_currency = Currency.default_currency

      divider = "-" * 10
      puts divider

      visited = {}

      (User::Supplier.all + User::CategorySupplier.all).each do |user|
        next if visited[user.id]
        visited[user.id] = true

        # check if should even merge roles?
        if user.has_any_role?(roles)
          required_updates += 1

          user.roles << roles[1] unless user.has_role?(roles[1])
          user.roles.delete(roles[0]) if user.has_role?(roles[0])

          categories = user.categories.where(:is_customer_unique => true, :type => LeadCategory).order("categories.id").all
          category = categories.detect { |c| c.name.mb_chars.downcase == user.to_s.mb_chars.downcase }

          unless category.present?
            category = LeadCategory.new(:name => user.to_s, :currency => default_currency)
          end

          category.owner_id = user.id
          category.is_customer_unique = true
          category.in_tray = true

          puts "updating user: ##{user.id}"

          user.save!(false)

          print "#{category.persisted? ? 'updating' : 'creating'} category \"#{category.name}\": "

          category.save!

          unless category.persisted?
            user.categories << category
          end

          puts "##{category.id}"

          puts divider
        end
      end

      if required_updates == 0
        puts "No updates needed"
      else
        puts "Users found: #{required_updates}"
      end
    end

  end
end

