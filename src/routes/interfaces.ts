import { NativeStackScreenProps } from "@react-navigation/native-stack";

export type PropsStackRoutes = {
    Login: undefined;
    Home: {
        name?: string;
    };
    Register: undefined;
}


export type PropsScreensApp<T extends keyof PropsStackRoutes> = NativeStackScreenProps<PropsStackRoutes, T>