type FlashType = 'notice' | 'alert';
type FlashMessage = {
    [key in FlashType]?: string;
}
type User = {
    id: number;
    username: string;
}

export type GlobalProps = {
    flash?: FlashMessage,
    user?: User;
}