module SetGame
  Card = Data.define(*ATTRIBUTES) do
    def to_s
      base = "#{number} #{shade} #{color} #{shape}"
      if number > 1
        base + "s"
      else
        base
      end
    end
  end
end
