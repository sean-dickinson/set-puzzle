import { expect, describe, it } from 'vitest';
import { getCardId, isSameCardTriad } from "@/set_game/cardHelpers.ts";
import type {SetCard} from "@/types/set-types.ts";
import type {CardTriad} from "@/set_game/checkSet.ts";

describe("getCardId", () => {
    it("should return the same ID for cards with the same attributes", () => {
        const card1: SetCard = {
            shape: 'oval',
            color: 'red',
            shade: 'solid',
            number: 1
        };
        const card2: SetCard = {
            shape: 'oval',
            color: 'red',
            shade: 'solid',
            number: 1
        };
        expect(getCardId(card1)).toBe(getCardId(card2));
    });

    it("should return different IDs for cards with different attributes", () => {
        const card1: SetCard = {
            shape: 'oval',
            color: 'red',
            shade: 'solid',
            number: 1
        };
        const card2: SetCard = {
            shape: 'oval',
            color: 'red',
            shade: 'solid',
            number: 2
        };
        expect(getCardId(card1)).not.toBe(getCardId(card2));
    });
});

describe("isSameCardTriad", () => {
    it("should return true for the same card triads regardless of order", () => {
        const card1: SetCard = {
            shape: 'oval',
            color: 'red',
            shade: 'solid',
            number: 1
        };
        const card2: SetCard = {
            shape: 'squiggle',
            color: 'green',
            shade: 'striped',
            number: 2
        };
        const card3: SetCard = {
            shape: 'diamond',
            color: 'purple',
            shade: 'open',
            number: 3
        };

        const triad1: CardTriad = [card1, card2, card3];
        const triad2: CardTriad = [card3, card2, card1];

        expect(isSameCardTriad(triad1, triad2)).toBe(true);
    });

    it("should return false for different card triads", () => {
        const card1: SetCard = {
            shape: 'oval',
            color: 'red',
            shade: 'solid',
            number: 1
        };
        const card2: SetCard = {
            shape: 'squiggle',
            color: 'green',
            shade: 'striped',
            number: 2
        };
        const card3: SetCard = {
            shape: 'diamond',
            color: 'purple',
            shade: 'open',
            number: 3
        };
        const card4: SetCard = {
            shape: 'oval',
            color: 'purple',
            shade: 'solid',
            number: 1
        };

        const triad1: CardTriad = [card1, card2, card3];
        const triad2: CardTriad = [card1, card2, card4];

        expect(isSameCardTriad(triad1, triad2)).toBe(false);
    });
});