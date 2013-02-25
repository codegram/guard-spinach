## guard-spinach

My fork of guard-spinach such that I could add the :generate option to it.

Thanks.

### Example Guardfile snippet

```ruby
guard 'spinach', all_on_start: true, generate:true do
  watch(%r|^features/(.*)\.feature|)
  watch(%r|^features/steps/(.*)([^/]+)\.rb|) do |m|
    "features/#{m[1]}#{m[2]}.feature"
  end
end
```
