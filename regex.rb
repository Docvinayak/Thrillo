def starts_with
  string.start_with?(regex.tr('^'))
end

def ends_with
  string.last?(reges.tr('&'))
end

def is_match(string, regex)
  return string.empty? if regex.empty?

  first = !string.empty? && [string[0], '.'].include?(regex[0])
  if regex[1] == '*'
    is_match(string, regex[2..-1]) || (first && is_match(string[1..-1], regex))
  else
    first && is_match(string[1..-1], regex[1..-1])
  end
end

def regex_matcher(string, regex)
  regex = Regexp.new regex
  string.match?(regex)
end

def regx_symbol(regex, string)
  return true unless regex != string
  return regex[1..-2] == string if regex[0] == '^' && regex[-1] == '$'
  return starts_with if regex[0] == '^'
  return ends_with if regex[-1] == '$'
  return is_match(string, regex) if regex.include?('*') || regex.include?('.')

  regex_matcher(string, regex)
end

regex = gets.chomp
string = gets.chomp
puts regx_symbol(regex, string);
