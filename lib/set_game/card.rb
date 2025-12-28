module SetGame
  Card = Data.define(*ATTRIBUTES) do
    class << self
      def from(string_or_hash)
        case string_or_hash
        when String then from_id(string_or_hash)
        when Hash then from_hash(string_or_hash)
        else
          raise ArgumentError, "Expected String or Hash, got #{string_or_hash.class}"
        end
      end

      private

      def from_id(id)
        number, shade, color, shape = id.split("-")
        new(
          number: number.to_i,
          shade: shade.to_sym,
          color: color.to_sym,
          shape: shape.to_sym
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
      base = "#{number} #{shade} #{color} #{shape}"
      if number > 1
        base + "s"
      else
        base
      end
    end

    def id
      [ number, shade, color, shape ].join("-")
    end

    def ==(other)
      ATTRIBUTES.all? { |attribute| send(attribute) == other.send(attribute) }
    end
  end
end
