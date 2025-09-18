import React from "react";
import { View, Text, Button } from "react-native";
import { PropsScreensApp } from "../routes/interfaces";

export default function Home({ navigation, route } : PropsScreensApp<"Home">) {
    return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
            <Text>Home. {route.params.name}</Text>
            <Button title="Ir para a Login" onPress={() => navigation.navigate("Login")}></Button>
            <Button title="Ir para a Register" onPress={() => navigation.navigate("Register")}></Button>
            <Button title="Voltar" onPress={() => navigation.goBack()}></Button>
        </View>

    )
}