"use server";

import { cookies } from "next/headers";

import { user } from "./data";
import type { User } from "./types";
import prisma from "../prisma";

function generateToken(): string {
	const arr = new Uint8Array(12);
	globalThis.crypto.getRandomValues(arr);
	return Array.from(arr, (v) => v.toString(16).padStart(2, "0")).join("");
}

export interface SignUpParams {
	firstName: string;
	lastName: string;
	email: string;
	password: string;
}

export interface SignInWithOAuthParams {
	provider: "google" | "discord";
}

export interface SignInWithPasswordParams {
	email: string;
	password: string;
}

export interface ResetPasswordParams {
	email: string;
}

export async function signUp(_: SignUpParams): Promise<{ data?: { user: User }; error?: string }> {
	// Store the user in the database

	/*
	const userAlreadyExists =  await prisma.user.findFirst({
		where:{
			email: data.email
		}
	})

	if(userAlreadyExists){
		throw new Error("Usuário já existe !!!")
	}

    // Criptografar a senha
    const passwordHash = await hash(password, 8)

	const user = await prismaClient.user.create({
	data:{
		name: data.name,
		email: data.email,
		password: passwordHash,
	},
	select:{
		id: true,
		name: true,
		email: true,
	}
	})*/

	const token = generateToken();
	const cookieStore = await cookies();
	cookieStore.set("access_token", token);

	return { data: { user } };
}

export async function signInWithOAuth(_: SignInWithOAuthParams): Promise<{ error?: string }> {
	return { error: "Social authentication not implemented" };
}

export async function signInWithPassword(
	params: SignInWithPasswordParams
): Promise<{ data?: { user: User }; error?: string }> {
	const { email, password } = params;

	/*const user = await prisma.user.findFirst({
		where:{
			email: email
		}
	})

	if(!user){
		throw new Error("Usuário/Senha incorreto !!!")
	}

	const passwordMatch = await compare(password, user.password)

	if(!passwordMatch){
		throw new Error("Usuário/Senha incorreto !!!")
	}
		*/

	// We hardcode the credentials for the simplicity of the example
	if (email !== "sofia@devias.io" || password !== "Secret1") {
		return { error: "Invalid credentials" };
	}

	const token = generateToken();
	const cookieStore = await cookies();
	cookieStore.set("access_token", token);

	return { data: { user } };
}

export async function resetPassword(_: ResetPasswordParams): Promise<{ error?: string }> {
	return { error: "Password reset not implemented" };
}

export async function updatePassword(_: ResetPasswordParams): Promise<{ error?: string }> {
	return { error: "Update reset not implemented" };
}

export async function signOut(): Promise<{ error?: string }> {
	const cookieStore = await cookies();
	cookieStore.delete("access_token");

	return {};
}
