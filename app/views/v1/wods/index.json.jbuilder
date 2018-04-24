json.data do
  json.array! @wods do |wod|
    json.partial! 'api/v1/wods/wod', wod: wod
  end
end
