import type * as React from "react";
import type { Metadata } from "next";
import RouterLink from "next/link";
import Avatar from "@mui/material/Avatar";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import Card from "@mui/material/Card";
import CardHeader from "@mui/material/CardHeader";
import Chip from "@mui/material/Chip";
import Divider from "@mui/material/Divider";
import Grid from "@mui/material/Grid2";
import Link from "@mui/material/Link";
import Stack from "@mui/material/Stack";
import { ArrowLeft as ArrowLeftIcon } from "@phosphor-icons/react/dist/ssr/ArrowLeft";
import { User as UserIcon } from "@phosphor-icons/react/dist/ssr/User";
import { appConfig } from "@/config/app";
import { paths } from "@/paths";
import { PropertyItem } from "@/components/core/property-item";
import { PropertyList } from "@/components/core/property-list";

export const metadata = { title: `Details | Type Persons | Dashboard | ${appConfig.name}` } satisfies Metadata;

export default function Page(): React.JSX.Element {
	return (
		<Box
			sx={{
				maxWidth: "var(--Content-maxWidth)",
				m: "var(--Content-margin)",
				p: "var(--Content-padding)",
				width: "var(--Content-width)",
			}}
		>
			<Stack spacing={4}>
				<Stack spacing={3}>
					<div>
						<Link
							color="text.primary"
							component={RouterLink}
							href={paths.dashboard.typepersons.list}
							sx={{ alignItems: "center", display: "inline-flex", gap: 1 }}
							variant="subtitle2"
						>
							<ArrowLeftIcon fontSize="var(--icon-fontSize-md)" />
							Type Persons
						</Link>
					</div>
				</Stack>
				<Grid container spacing={4}>
					<Grid
						size={{
							lg: 12,
							xs: 12,
						}}
					>
						<Stack spacing={4}>
							<Card>
								<CardHeader
									avatar={
										<Avatar>
											<UserIcon fontSize="var(--Icon-fontSize)" />
										</Avatar>
									}
									title="Basic details"
								/>
								<PropertyList
									divider={<Divider />}
									orientation="vertical"
									sx={{ "--PropertyItem-padding": "12px 24px" }}
								>
									{(
										[
											{ key: "Customer ID", value: <Chip label="USR-001" size="small" variant="soft" /> },
											{ key: "Name", value: "Miron Vitold" },
										] satisfies { key: string; value: React.ReactNode }[]
									).map(
										(item): React.JSX.Element => (
											<PropertyItem key={item.key} name={item.key} value={item.value} />
										)
									)}
								</PropertyList>
							</Card>
							<div>
								<Button  color="error" variant="contained">
									Delete
								</Button>
							</div>
						</Stack>
					</Grid>				
				</Grid>
			</Stack>
		</Box>
	);
}