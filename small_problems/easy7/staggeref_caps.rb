def staggered_case(str, first_choice=:upcase)
  str = str.chars.each_with_index do |letter, idx|
    next unless ('a'..'z').cover?(letter.downcase)
    if first_choice == :upcase
      idx.even? ? letter.upcase! : letter.downcase!
    elsif first_choice == :downcase
      idx.even? ? letter.downcase! : letter.upcase!
    end
  end
  str.join
end

p staggered_case('I Love Launch School!', :upcase) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case("hi i'm back", :downcase) == "hI I'M BaCk"


def staggered_case(string, choice=:ignore)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if choice == :ignore
      unless ('a'..'z').cover?(char.downcase)
        result += char
        next
      end
    end

    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('ALL_CAPS', :include) == 'AlL_CaPs'