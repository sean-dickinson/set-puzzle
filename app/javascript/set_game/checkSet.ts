import type {SetCard} from "@/types/set-types.ts";
import {ATTRIBUTES} from "@/set_game/cardHelpers.ts";
export type CardTriad = [SetCard, SetCard, SetCard];


export interface SuccessfulSetResult {
    cards: CardTriad
    success: true;
}
export interface InvalidSetResult {
    cards: CardTriad
    success: false;
    message: string;
}

export type SetResult = SuccessfulSetResult | InvalidSetResult;

interface AttributeValues {
    shape: Set<SetCard['shape']>;
    color: Set<SetCard['color']>;
    shade: Set<SetCard['shade']>;
    number: Set<SetCard['number']>;
}

const getFailingAttribute = (attributeValues: AttributeValues) => {
    for(const attr of ATTRIBUTES){
        if(attributeValues[attr].size === 2){
            return attr;
        }
    }
    throw new Error('No attribute failing attribute found');
}

const enhanceGrammar = (attribute: keyof SetCard, value: string, plural = false): string => {
    if(attribute === 'color' || attribute === 'shade'){
        return plural ? `are ${value}` : `is ${value}`;
    }
    if(attribute === 'shape'){

        if(plural){
            return `are ${value}s`;
        }
        let article = 'a';
        if (value === 'oval'){
            article += 'n'
        }
        return `is ${article} ${value}`;
    }
    if(attribute === 'number'){
        const numberAsText = {
            '1': 'one',
            '2': 'two',
            '3': 'three'
        }[value];
        const shapeText = value !== '1' ? 'shapes' : 'shape';

        if(plural){
            return `have ${numberAsText} ${shapeText}`
        }
        return `has ${numberAsText} ${shapeText}`;
    }
}

const getErrorMessage = (cards: CardTriad, attributeValues: AttributeValues): string => {
    const attribute = getFailingAttribute(attributeValues);
    const valueCounts = cards.reduce((acc, card) => {
        const valueAsString = card[attribute].toString();
        if(!acc[valueAsString]){
            acc[valueAsString] = 0;
        }
        acc[valueAsString]++;
        return acc;
    }, {});

    const valueWith2 = Object.entries(valueCounts).find(([_, count]) => count === 2).at(0) as string;
    const valueWith1 = Object.entries(valueCounts).find(([_, count]) => count === 1).at(0) as string;

    const enhancedGrammarFor2 = enhanceGrammar(attribute, valueWith2, true);
    const enhancedGrammarFor1 = enhanceGrammar(attribute, valueWith1);
    return `Two ${enhancedGrammarFor2} and one ${enhancedGrammarFor1}`;
}

const isValid = (attributeValues: AttributeValues): boolean => {
    let uniqueCount = 0;
    let constantCount = 0;
    for(const attr of ATTRIBUTES){
        if(attributeValues[attr].size === 1){
            constantCount++;
        } else if(attributeValues[attr].size === 3){
            uniqueCount++;
        }
    }
    return uniqueCount + constantCount === 4;
}


export function checkSet(cards: CardTriad): SetResult {
    let attributeValues: AttributeValues = {
        shape: new Set<SetCard['shape']>([]),
        color: new Set<SetCard['color']>([]),
        shade: new Set<SetCard['shade']>([]),
        number: new Set<SetCard['number']>([])
    }
    attributeValues = cards.reduce((acc, card) => {
        for(const attr of ATTRIBUTES){
                const value = card[attr];
                // @ts-expect-error TS thinks the set has a value of 'never' here
                acc[attr].add(value);
        }
        return acc;
    }, attributeValues);

    if(isValid(attributeValues)){
        return {
            cards,
            success: true
        };
    }

    return {
        cards,
        success: false,
        message: getErrorMessage(cards, attributeValues)
    }


}