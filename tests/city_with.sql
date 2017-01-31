CREATE OR REPLACE FUNCTION startup_insert(
) RETURNS SETOF TEXT AS $$
    RETURN NEXT is( MAX(nick), NULL, 'Should have no users') FROM users;
    INSERT INTO users (nick) VALUES ('theory');
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION test_user(
) RETURNS SETOF TEXT AS $$
   SELECT is( nick, 'theory', 'Should have nick') FROM users;
END;
$$ LANGUAGE sql;

-- Insert stuff.
SELECT ok(
    insert_stuff( 'www.foo.com', '{1,2,3}', :domain_id, :src_id ),
    'insert_stuff() should return true'
);

-- Check for domain stuff records.
SELECT is(
    ARRAY(
        SELECT stuff_id
          FROM domain_stuff
         WHERE domain_id = :domain_id
           AND src_id = :src_id
         ORDER BY stuff_id
    ),
    ARRAY[ 1, 2, 3 ],
    'The stuff should have been associated with the domain'
);

SELECT * FROM finish();
ROLLBACK;
