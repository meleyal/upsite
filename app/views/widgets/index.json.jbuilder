json.array!(@widgets) do |widget|
  json.partial! 'widgets/widget', widget: widget
end