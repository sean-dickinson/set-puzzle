import type {SetCard} from "@/types/set-types.ts";
import { type CardTriad, checkSet } from "@/set_game/checkSet.ts";
import {ref, computed, watchEffect} from "vue";
import {getCardId, isSameCardTriad} from "@/set_game/cardHelpers.ts";


const foundSets = ref<CardTriad[]>([]);
const currentSelection = ref<SetCard[]>([]);
const isGameOver = computed(() => foundSets.value.length === 6);
const errorMessage = ref('');
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

    watchEffect(() => {
        if(currentSelection.value.length !== 3){
            return;
        }
        errorMessage.value = '';

        if(isSetAlreadyFound(currentSelection.value as CardTriad)){
            errorMessage.value = 'You already found that one';
            clearSelection();
            return;
        }

        const result = checkSet(currentSelection.value as CardTriad);
        if(result.success === true){
            foundSets.value.push(result.cards);
        } else {
            errorMessage.value = result.message;
        }
        clearSelection();
    });

    return {
        isGameOver,
        isCardCurrentlySelected,
        toggleSelection,
        foundSets,
        currentSelection,
        errorMessage
    }
}