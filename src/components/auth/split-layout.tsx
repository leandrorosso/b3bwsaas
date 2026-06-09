import type * as React from "react";
import Box from "@mui/material/Box";
import Stack from "@mui/material/Stack";
import Typography from "@mui/material/Typography";

export interface SplitLayoutProps {
	children: React.ReactNode;
}

export function SplitLayout({ children }: SplitLayoutProps): React.JSX.Element {
	return (
		<Box sx={{ display: "grid", gridTemplateColumns: { xs: "1fr", lg: "1fr 800px" }, minHeight: "100%" }}>
			<Box
				sx={{
					alignItems: "center",
					justifyContent: "center",
					bgcolor: "var(--mui-palette-background-level1)",
					display: { xs: "none", lg: "flex" },
					flexDirection: "column",
					p: 3,
				}}
			>
				<Stack spacing={4} sx={{ maxWidth: "700px" }}>
					<Stack spacing={1}>
						<Typography variant="h4">Bem-vindo ao Sistema B3BW Sistemas</Typography>
						<Typography color="text.secondary">
							A B3BW Sistemas oferece soluções inteligentes para a gestão de processos e workflow, auxiliando empresas a automatizar atividades, padronizar fluxos de trabalho e aumentar a eficiência operacional.<br />

							Nossa plataforma foi desenvolvida para simplificar o controle de processos, promover a colaboração entre equipes e fornecer maior visibilidade sobre as operações, permitindo decisões mais rápidas e assertivas.<br /> <br />

							<b>Transforme seus processos em resultados com tecnologia, agilidade e inovação.</b>
						</Typography>
					</Stack>
				</Stack>
			</Box>
			<Box sx={{ boxShadow: "var(--mui-shadows-8)", display: "flex", flexDirection: "column" }}>
				<Box
					sx={{
						alignItems: "center",
						display: "flex",
						flexDirection: "column",
						flex: "1 1 auto",
						justifyContent: "center",
						p: 3,
					}}
				>
					<Box sx={{ maxWidth: "420px", width: "100%" }}>{children}</Box>
				</Box>
			</Box>
		</Box>
	);
}
