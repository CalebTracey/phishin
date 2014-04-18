namespace :likes do

  desc "Find and destroy orphan Likes"
  task :destroy_orphans => :environment do
    num_orphans = 0
    Like.all.each do |like|
      if like.likable_type == 'Track'
        unless track = Track.where(id: like.likable_id).first
          num_orphans += 1
          # like.destroy
        end
      elsif like.likable_type == 'Show'
        unless show = Show.where(id: like.likable_id).first
          num_orphans += 1
          # like.destroy
        end
      end
    end
    puts "Total orphaned Likes destroyed: #{num_orphans}"
  end

end