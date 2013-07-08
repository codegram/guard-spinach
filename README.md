## guard-spinach

### Options

<dl>
  <dt>all_on_start</dt>
  <dd>Boolean. Run all features on start.</dd>

  <dt>generate</dt>
  <dd>Boolean. Auto generate missing step files during each run.</dd>

  <dt>backtrace</dt>
  <dd>Boolean. Show backtrace</dd>

  <dt>tags</dt>
  <dd>Array. Run scenarion mark with tags</dd>

  <dt>command_prefix</dt>
  <dd>String. Allows you to inject something before the `spinach` command. E.g. `zeus spinach`.</dd>
</dl>

### Example Guardfile snippet

```ruby
guard 'spinach', command_prefix: 'zeus', all_on_start: true, generate: true, backtrace: true, tags:["@javascript", "~@disabled"] do
  watch(%r|^features/(.*)\.feature|)
  watch(%r|^features/steps/(.*)([^/]+)\.rb|) do |m|
    "features/#{m[1]}#{m[2]}.feature"
  end
end
```

## License

MIT (Expat) License. Copyright 2011 [Codegram Technologies](http://codegram.com)
