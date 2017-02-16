namespace :cleanup do
  desc 'Delete free sites with ≤ 1 block'
  task :sites => :environment do
    Site.joins(:blocks)
      .select { |site| site.blocks.size <= 1 && site.owner.plan == Plan.free }
      .each { |s| s.owner.destroy }
  end
end
