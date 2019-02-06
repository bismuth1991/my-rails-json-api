@services.each do |service|
  json.set! service.id do
    json.partial! "service", service: service
  end
end