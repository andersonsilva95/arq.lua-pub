-- AI_Monster.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "mystic_golem_wait.frm",
        Func    = "Monster_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Monster_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "Monster_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 75,
                AIFunc              = "Monster_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- �޸���
            {
                AICheckFrame        = 75,
                AIFunc              = "Monster_Check_Run",
                DelayFrame          = 110,
            },
            -- ��������01
            {
                AICheckFrame        = 35,
                AIFunc              = "Monster_Check_Attack01",
                DelayFrame          = 55,
            },
            
            -- ���̾�극���䳻����
            {
                AICheckFrame        = 65,
                AIFunc              = "Monster_Check_Attack02",
                DelayFrame          = 100,
            },
            
            -- �����ũ
            {
                AICheckFrame        = 135,
                AIFunc              = "Monster_Check_Attack03",
                DelayFrame          = 155,
            },
            
            -- ��������01
            {
                AICheckFrame        = 55,
                AIFunc              = "Monster_Check_Attack04",
                DelayFrame          = 45,
            },

            -- ��������
            {
                AICheckFrame        = 75,
                AIFunc              = "Monster_Check_HighJump",
                DelayFrame          = 75,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 220,
                AIFunc              = "Monster_Check_JumpDown",
                DelayFrame          = 220,
            },            
            -- ������(����)
            {
                AICheckFrame        = 110,
                AIFunc              = "Monster_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- �̵�
    {
        ID      = "RUN",
        Motion  = "mystic_golem_walk.frm",
        Func    = "Monster_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Monster_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Monster_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "Monster_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- ��������01
            {
                AICheckFrame        = 15,
                AIFunc              = "Monster_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Monster_Check_HighJump",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 220,
                AIFunc              = "Monster_Check_JumpDown",
                DelayFrame          = 220,
            },
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Monster_Check_RunStop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ������
    {
        ID              = "IDLE",
        Motion          = "mystic_golem_wait.frm",
        Func            = "Monster_IdleFunc",

        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 45,
                AIFunc              = "Monster_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },
    
    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "mystic_golem_attack01.frm",
        Func    = "Monster_Attack01Func",
    },
    
    -- ���̾�극���䳻����
    {
        ID      = "ATTACK02",
        Motion  = "mystic_golem_attack02.frm",
        Func    = "Monster_Attack02Func",
    },
    
    
    
    {
        ID      = "ATTACK03",
        Motion  = "mystic_golem_attack03.frm",
        Func    = "Monster_Attack03Func",
    },
    
    
    {
        ID      = "ATTACK04",
        Motion  = "mystic_golem_punch.frm",
        Func    = "Monster_Attack04Func",
    },
    
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "mystic_golem_jump.frm",
        Func    = "Monster_JumpFunc",
    },

    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "mystic_golem_damage.frm",
        Func    = "Monster_DamageFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "mystic_golem_die.frm",
        Func    = "Monster_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "mystic_golem_standup.frm",
        Func    = "Monster_StandupFunc",
        IsFallDownMotion    = TRUE,
    },    
}

CallBack =
{
    Land    = "OnMonster_Land",
    Die     = "OnMonster_Die",
    Damage  = "OnMonster_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitMonster( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Monster_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �޸��� ����
function Monster_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- ������ ����
function Monster_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )        
    end
end


-- �״»���
function Monster_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end


-- ������ ������
function Monster_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
        pMonster:SetState( "WAIT" )
    end
end

-- �Ͼ��
function Monster_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  �������� ����
function Monster_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 24 ) then
		pMonster:StartAttack( 5, PAR_DOWN, 0.1, 15,17, 5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���̾�극���䳻���� ����
function Monster_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 61 ) then
	    
		pMonster:AddParticle( "Golem_Breath_01", 0.3, 0.4 )		
		pMonster:AddParticle( "Golem_Breath_02", 0.3, 0.4 )		
		pMonster:AddParticle( "Golem_Breath_03", 0.3, 0.4 )		
		pMonster:AddParticle( "Golem_Breath_04", 0.3, 0.4 )		
		
	elseif( iFrame > 62 and iFrame < 90 ) then
	    if( iFrame % 3 == 0 ) then
	        pMonster:AddDamageWithLocate( DT_MONSTER_SWAMP_GOLEM_BREATH, 0.05 , 0.38 )	    
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Monster_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:StartText( "JUMP" )
	elseif( iFrame == 50 ) then		
		pMonster:EarthQuake( 38, 0.06, 0.025 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Monster_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )	
	elseif( iFrame == 120 ) then	
		pMonster:StartAttack( 8, PAR_DOWN, 0.1, 13,17, 8 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  ���� ����
function Monster_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function Monster_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Monster_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function Monster_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function Monster_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Monster_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "RUN" )
        pMonster:ResetDelay()
    end
end

function Monster_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 150, 100, -100 ) == true ) then
		pMonster:TurnToTarget()
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function Monster_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -200, 150, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Monster_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 330, -200, 150, 200, -100 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Monster_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    pMonster:SetState( "ATTACK03" )
	pMonster:ResetDelay()
    
end

function Monster_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -200, 150, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end



function Monster_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 360, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Monster_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Monster_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -100, -40, 100, -300 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Monster_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnMonster_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    end
end

function OnMonster_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
	
end

function OnMonster_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 2.0 / 3.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() / 3.0 )
	
	if ( pMonster:GetIsContact() == true ) then
	    if ( pMonster:FloatRand() < 0.1  ) then
		    pMonster:SetState( "ATTACK03" )
		elseif( pMonster:FloatRand() < 0.1 ) then
		    pMonster:TurnToTarget()
		    pMonster:SetState( "ATTACK04" )
	    end
	end
end

function Monster_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Monster_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.446) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )		
		end
	end
end