export interface User {
	id: string;
	name: string | null;
	firstname: string;
	lastname: string;
	email: string;
	emailVerified: string;
	image: string | null;
	address: string | null;
	phone: string | null;
	status: boolean;
	stripe_customer_id: string | null;
	inactive: boolean;
	created_at: Date | null;
	updated_at: Date | null;
}