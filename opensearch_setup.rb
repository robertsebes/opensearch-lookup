require 'opensearch-ruby'
require 'dotenv/load'

client = OpenSearch::Client.new(
  hosts: [ENV['OS_H']],
  user: ENV['OS_U'],
  password: ENV['OS_PW'],
  transport_options: { ssl: { verify: false } }
)

puts "Connected to OpenSearch! Indices available:"
pp client.cat.indices(format: 'json').map { |i| i['index'] }



loop do
  print "\nEnter search term (or type 'exit' to quit): "
  term = gets.chomp
  break if term.downcase == 'exit'

  page = 0
  loop do
    response = client.search(
      index: '_all',            # searches all indices
      body: {
        query: { query_string: { query: term } },
        from: page * 10,
        size: 10
      }
    )

    hits = response['hits']['hits']
    if hits.empty?
      puts "No more results."
      break
    end

    hits.each_with_index do |doc, idx|
      puts "#{page * 10 + idx + 1}. [#{doc['_index']}] #{doc['_source']}"
    end

    page += 1
    print "\nPress Enter for next 10 results, or type 'stop': "
    continue = gets.chomp
    break if continue.downcase == 'stop'
  end
end

puts "Goodbye!"









