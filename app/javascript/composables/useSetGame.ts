import type {SetCard} from "@/types/set-types.ts";
import { type CardTriad, checkSet } from "@/set_game/checkSet.ts";
import {ref, computed, watchEffect} from "vue";
import {getCardId, isSameCardTriad} from "@/set_game/cardHelpers.ts";


const foundSets = ref<CardTriad[]>([]);
const currentSelection = ref<SetCard[]>([]);
const isGameOver = computed(() => foundSets.value.length === 6);
const message = ref('');
export function useSetGame(){
    const isSetAlreadyFound = (cards: CardTriad): boolean =>
         foundSets.value.some(set => isSameCardTriad(set, cards));
    const clearSelection = () => currentSelection.value = [];

    const isCardCurrentlySelected = (card: SetCard) => currentSelection.value.some(c => getCardId(c) === getCardId(card))
    const toggleSelection = (card: SetCard) => {
        if(isCardCurrentlySelected(card)){
            currentSelection.value = currentSelection.value.filter(c => getCardId(c) !== getCardId(card));
        }
        else if(currentSelection.value.length < 3){
            currentSelection.value.push(card);
        }
    }

    const getSuccessMessage = () => {
        const numberOfSetsRemaining = 6 - foundSets.value.length;
        if(numberOfSetsRemaining === 0){
            return 'You found all sets! Congratulations!';
        }
        const plural = numberOfSetsRemaining > 1 ? 's' : '';
        return `You found a set! ${numberOfSetsRemaining} set${plural} remaining.`;

    }

    watchEffect(() => {
        if(currentSelection.value.length !== 3){
            return;
        }
        message.value = '';

        if(isSetAlreadyFound(currentSelection.value as CardTriad)){
            message.value = 'You already found that one';
            clearSelection();
            return;
        }

        const result = checkSet(currentSelection.value as CardTriad);
        if(result.success === true){
            foundSets.value.push(result.cards);
            message.value = getSuccessMessage();
        } else {
            message.value = 'Not a set. ' + result.message;
        }
        clearSelection();
    });

    return {
        isGameOver,
        isCardCurrentlySelected,
        toggleSelection,
        foundSets,
        currentSelection,
        message
    }
}