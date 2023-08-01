class Code

  attr_reader :secret_code

  def initialize
    @secret_code = make_secret_code
  end

  def make_secret_code
    sec_code = []
    4.times do
      sec_code.push(rand(6))
    end
    sec_code
  end
end
