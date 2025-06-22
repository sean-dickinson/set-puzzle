import { describe, it, expect } from 'vitest';
import {type CardTriad, type SetResult, checkSet, type InvalidSetResult} from "@/set_game/checkSet.ts";

function assertIsInvalidSet(result: SetResult): asserts result is InvalidSetResult {
    expect(result.success).toBe(false);
}

describe("checkSet", () => {
    describe("successful sets", () => {
        it("is valid when all cards have 4 unique attributes", () => {
            const cards: CardTriad = [
                {
                    number: 1,
                    shape: 'diamond',
                    color: 'red',
                    shade: 'solid'
                },
                {
                    number: 2,
                    shape: 'squiggle',
                    color: 'green',
                    shade: 'striped'
                },
                {
                    number: 3,
                    shape: 'oval',
                    color: 'purple',
                    shade: 'open'
                }
            ];
            const result = checkSet(cards);
            expect(result.success).toBe(true);
        });
        it("is valid when the cards have 1 constant attribute and 3 unique attributes", () => {
            const cards: CardTriad = [
                {
                    number: 1,
                    shape: 'diamond',
                    color: 'red',
                    shade: 'solid'
                },
                {
                    number: 2,
                    shape: 'diamond',
                    color: 'green',
                    shade: 'striped'
                },
                {
                    number: 3,
                    shape: 'diamond',
                    color: 'purple',
                    shade: 'open'
                }
            ];
            const result = checkSet(cards);
            expect(result.success).toBe(true);
        });
        it("is valid when the cards have 2 constant attributes and 2 unique attribute", () => {
            const cards: CardTriad = [
                {
                    number: 1,
                    shape: 'squiggle',
                    color: 'red',
                    shade: 'solid'
                },
                {
                    number: 2,
                    shape: 'squiggle',
                    color: 'red',
                    shade: 'striped'
                },
                {
                    number: 3,
                    shape: 'squiggle',
                    color: 'red',
                    shade: 'open'
                }
            ];
            const result = checkSet(cards);
            expect(result.success).toBe(true);
        });
        it("is valid when the cards have 3 constant attributes and 1 unique attribute", () => {
            const cards: CardTriad = [
                {
                    number: 1,
                    shape: 'oval',
                    color: 'red',
                    shade: 'solid'
                },
                {
                    number: 1,
                    shape: 'oval',
                    color: 'red',
                    shade: 'striped'
                },
                {
                    number: 1,
                    shape: 'oval',
                    color: 'red',
                    shade: 'open'
                }
            ];
            const result = checkSet(cards);
            expect(result.success).toBe(true);
        });
    });
    describe("invalid sets", () => {
        it("is invalid when the cards have 1 constant attribute, 2 unique attributes, and varied attribute", () => {
            const cards: CardTriad = [
                {
                    number: 1,
                    shape: 'diamond',
                    color: 'red',
                    shade: 'solid'
                },
                {
                    number: 1,
                    shape: 'squiggle',
                    color: 'green',
                    shade: 'solid'
                },
                {
                    number: 1,
                    shape: 'oval',
                    color: 'purple',
                    shade: 'open'
                }
            ];
            const result = checkSet(cards);
            assertIsInvalidSet(result);
            expect(result.message).toBe("Two are solid and one is open")
        });
        it("is invalid when the cards have 2 constant attributes, 1 unique attribute, and varied attribute", () => {
            const cards: CardTriad = [
                {
                    number: 1,
                    shape: 'squiggle',
                    color: 'red',
                    shade: 'open'
                },
                {
                    number: 2,
                    shape: 'squiggle',
                    color: 'red',
                    shade: 'open'
                },
                {
                    number: 3,
                    shape: 'oval',
                    color: 'red',
                    shade: 'open'
                }
            ];
            const result = checkSet(cards);
            assertIsInvalidSet(result);
            expect(result.message).toBe("Two are squiggles and one is an oval");
        });

        it("is invalid when the cards have 3 constant attributes and varied attribute", () => {
            const cards: CardTriad = [
                {
                    number: 1,
                    shape: 'oval',
                    color: 'red',
                    shade: 'solid'
                },
                {
                    number: 1,
                    shape: 'oval',
                    color: 'red',
                    shade: 'solid'
                },
                {
                    number: 3,
                    shape: 'oval',
                    color: 'red',
                    shade: 'solid'
                }
            ];
            const result = checkSet(cards);
            assertIsInvalidSet(result);
            expect(result.message).toBe("Two have one shape and one has three shapes");

        });
    });

});