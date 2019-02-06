@services.each do |service|
  json.set! service.id do
    json.extract! service, :id, :name, :price
  end
end