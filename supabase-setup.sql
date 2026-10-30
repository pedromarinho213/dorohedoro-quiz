-- Cole este SQL inteiro no Supabase: SQL Editor > New query > Run

create table if not exists public.resultados (
  id uuid primary key default gen_random_uuid(),
  nome text not null check (char_length(trim(nome)) between 1 and 60),
  personagem text not null,
  respostas jsonb not null,
  created_at timestamptz not null default now()
);

alter table public.resultados enable row level security;

-- qualquer pessoa pode ver os resultados e enviar o seu; ninguém altera nem apaga
create policy "ler resultados" on public.resultados
  for select to anon using (true);

create policy "enviar resultado" on public.resultados
  for insert to anon with check (true);
