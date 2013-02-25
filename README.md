## guard-spinach

### Options

<dl>
  <dt>all_on_start</dt>
  <dd>Boolean. Run all features on start.</dd>

  <dt>generate</dt>
  <dd>Boolean. Auto generate missing step files during each run.</dd>

  <dt>command_prefix</dt>
  <dd>String. Allows you to inject something before the `spinach` command. E.g. `zeus spinach`.</dd>
</dl>

### Example Guardfile snippet

```ruby
guard 'spinach', command_prefix: 'zeus', all_on_start: true, generate: true do
  watch(%r|^features/(.*)\.feature|)
  watch(%r|^features/steps/(.*)([^/]+)\.rb|) do |m|
    "features/#{m[1]}#{m[2]}.feature"
  end
end
```
