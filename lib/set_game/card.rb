module SetGame
  Card = Data.define(*ATTRIBUTES) do
    include Comparable
    class << self
      def from(value)
        case value
        when self then value
        when String then from_string(value)
        when Hash then from_hash(value)
        else
          raise ArgumentError, "Expected String or Hash, got #{value.class}"
        end
      end

      private

      def from_string(str)
        number, shade, color, shape = str.split
        new(
          number: number.to_i,
          shade: shade.to_sym,
          color: color.to_sym,
          shape: SetGame.singluarize(shape).to_sym
        )
      end

      def from_hash(hash)
        transformed = hash.transform_values do
          if it.is_a? Integer
            it
          else
            it.to_sym
          end
        end
        new(**transformed)
      end
    end

    def to_s
      s = "#{number} #{shade} #{color} #{shape}"
      SetGame.pluralize(number, s)
    end
    alias inspect to_s

    def <=>(other)
      to_s <=> other.to_s
    end
  end
end
