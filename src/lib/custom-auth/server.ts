import "server-only";

import { cookies } from "next/headers";

import { user } from "./data";
import type { User } from "./types";
import prisma from "../prisma";

export async function getUser(): Promise<{ data?: { user: User | null }; error?: string }> {
	const cookieStore = await cookies();
	const token = cookieStore.get("access_token");

	if (!token) {
		return { data: { user: null } };
	}
	
  const session = await prisma.session.findUnique({
    where: {
      sessionToken: token.value,
    },
    include: {
      user: true,
    },
  });

  if (!session || session.expires < new Date()) {
    return { data: { user: null } };
  }

  return {
    data: {
      user: { id: session.user.id, 
							email: session.user.email, 
							name: session.user.name, 
							firstname: session.user.firstname, 
							lastname: session.user.lastname, 
							address: session.user.address, 
							phone: session.user.phone, 
							status: session.user.status, 
							inactive: session.user.inactive, 
							created_at: session.user.created_at, 
							updated_at: session.user.updated_at, 
							stripe_customer_id: session.user.stripe_customer_id, 
							emailVerified: '', 
							image: session.user.image
					},
    },
  };
}
