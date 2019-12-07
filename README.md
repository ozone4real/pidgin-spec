# pidgin-spec
Simple DSL for writing Ruby unit tests in Pidgin language. Developed with pure Ruby

#### JUST FOR FUN
Decided to apply what I have learnt from Meta-Programming in Ruby. This is what I could come up with for now. Would work on more serious stuff later 🤪). Inspired by RSPEC

### Installation
To install run:
```gem install pidgin_spec```

### Basic Usage
```ruby
require 'pidgin_spec'
PidginSpec.describe 'Pidgin test' do
  num = 30
  describe "Multiplication test" do
    e_go "test say multiplication dey work" do
      # test for positive result with 'go'
      expect_say(num * 5).go dey_equal_to(150)
    end
  end
  describe 'Division Test' do
    e_go "test say division dey work" do
      # test for negative result with 'no_go'
      expect_say(num/ 5).no_go dey_equal_to(6)
    end
  end
  # test for primitive types
  describe "Type test" do
    e_go "test say the type correct" do
      str = "I am a boy"
      expect_say(str.split(' ')).go be(Array)
    end
  end
end```
Run the test file with ruby test_file.rb
