# Catalog Seed

Catalog.destroy_all

catalogs = [
    {
        name: 'Mug',
        description: 'Lorem impsum',
        image: 'https://source.unsplash.com/jyjfTfr-fSA',
        price: 10.00
    }
]

catalogs.each do |catalog|
  Catalog.create catalog
end