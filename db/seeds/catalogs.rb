# Catalog Seed

Catalog.destroy_all

catalogs = [
    {
        name: 'Mug',
        description: Faker::Lorem.paragraph_by_chars,
        image: 'https://source.unsplash.com/jyjfTfr-fSA',
        price: 9.99
    },
    {
        name: 'T-Shirt',
        description: Faker::Lorem.paragraph_by_chars,
        image: 'https://source.unsplash.com/R3ot0RljP_4',
        price: 19.99
    },
    {
        name: 'Pen',
        description: Faker::Lorem.paragraph_by_chars,
        image: 'https://source.unsplash.com/S8hIymyo7ts',
        price: 4.99
    },
    {
        name: 'Backpacks',
        description: Faker::Lorem.paragraph_by_chars,
        image: 'https://source.unsplash.com/1Pgq9ZpIatI',
        price: 29.99
    },
    {
        name: 'Business Card',
        description: Faker::Lorem.paragraph_by_chars,
        image: 'https://source.unsplash.com/WX5jK0BT5JQ',
        price: 0.99
    }
]

catalogs.each do |catalog|
  Catalog.create catalog
end
