type CardShape = 'diamond' | 'squiggle' | 'oval';
type CardColor = 'red' | 'green' | 'purple';
type CardShading = 'solid' | 'striped' | 'open';
type CardNumber = 1 | 2 | 3;

export type SetCard = {
  shape: CardShape;
  color: CardColor;
  shade: CardShading;
  number: CardNumber;
};

export type ShapeProps = Pick<SetCard, 'color' | 'shade'>

export type Puzzle = {
  cards: SetCard[],
  date: string,
}