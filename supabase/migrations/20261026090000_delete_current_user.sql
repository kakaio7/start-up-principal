create or replace function public.delete_current_user()
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
    current_user_id uuid := auth.uid();
begin
    if current_user_id is null then
        raise exception 'É necessário entrar na conta para excluí-la.';
    end if;

    delete from auth.users
    where id = current_user_id;

    if not found then
        raise exception 'A conta não foi encontrada.';
    end if;
end;
$$;

revoke all on function public.delete_current_user() from public, anon;
grant execute on function public.delete_current_user() to authenticated;
