import type {SetCard} from "@/types/set-types.ts";
import type {CardTriad} from "@/set_game/checkSet.ts";
export const ATTRIBUTES: Array<keyof SetCard> = ['shape', 'color', 'shade', 'number'];
export const getCardId = (card: SetCard) => ATTRIBUTES.map(attr => card[attr].toString()).join('-');

export const isSameCardTriad = (a: CardTriad, b: CardTriad): boolean => new Set([...a.map(getCardId), ...b.map(getCardId)]).size === 3

export const getAttributeOptions = (attribute: keyof SetCard): Array<SetCard[keyof SetCard]> => {
    switch(attribute){
        case 'shape':
            return ['diamond', 'squiggle', 'oval'];
        case 'color':
            return ['red', 'green', 'purple'];
        case 'shade':
            return ['solid', 'striped', 'open'];
        case 'number':
            return [1, 2, 3];
    }
}