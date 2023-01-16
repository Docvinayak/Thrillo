def starts_with
  string.start_with?(regex.tr('^'))
end

def ends_with
  string.last?(reges.tr('&'))
end

def is_match(s, p)
  return s.empty? if p.empty?

  first = !s.empty? && [s[0], '.'].include?(p[0])
  if p[1] == '*'
    is_match(s, p[2..-1]) || (first && is_match(s[1..-1], p))
  else
    first && is_match(s[1..-1], p[1..-1])
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
puts regx_symbol(regex, string)
