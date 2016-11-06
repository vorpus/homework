def better_tracks_query
  albums = self.albums.includes(:tracks)
  tracks_count = {}
  albums.each do |album|
    tracks_count[album.name] = album.tracks.length
  end

  tracks_count
end

def better_seeds_query
  plants = self.plants.includes(:seeds)
  seeds = []
  plants.each do |plant|
    seeds << plant.seeds
  end

  seeds
end

def better_drivers_query
  buses = self.buses.includes(:drivers)

  all_drivers = {}
  buses.each do |bus|
    drivers = []
    bus.drivers.each do |driver|
      drivers << driver.name
    end
    all_drivers[bus.id] = drivers
  end

  all_drivers
end
