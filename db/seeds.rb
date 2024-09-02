require "csv"

CSV.foreach('db/seeds/csv/content.csv', headers: true) do |row|
  Content.create(
    title: row['title'],
    image_url :row['image_url'],
    director: row['director'],
    description: row['description'],
    open_date: row['open_date']
  )
end