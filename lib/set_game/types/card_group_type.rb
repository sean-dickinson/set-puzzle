# frozen_string_literal: true

module SetGame
  module Types
    class CardGroupType < ActiveRecord::Type::Json
      def cast(value)
        Array.wrap(value).map do
          case it
          when SetGame::CardGroup
            it
          when Hash
            SetGame::CardGroup.from(it)
          else
            raise ArgumentError, "Expected SetGame::CardGroup, or Hash, got #{it.class}"
          end
        end
      end

      def serialize(value)
        super(Array.wrap(value).map(&:to_h))
      end

      def deserialize(value)
        cast(super(value))
      end
    end
  end
end
