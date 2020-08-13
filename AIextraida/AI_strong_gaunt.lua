-- AI_Gargoyle.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- Ÿ������
            {
                AICheckFrame        = 165,
                AIFunc              = "Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- �����̵�
            {
                AICheckFrame        = 30,
                AIFunc              = "Gargoyle_Check_MoveUp",
                DelayFrame          = 30,
            },
            -- �Ʒ����̵� ��
            {
                AICheckFrame        = 41,
                AIFunc              = "Gargoyle_Check_MoveDownLeft",
                DelayFrame          = 40,
            },
            -- �Ʒ����̵� ��
            {
                AICheckFrame        = 40,
                AIFunc              = "Gargoyle_Check_MoveDownRight",
                DelayFrame          = 41,
            },


            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Attack01",
                DelayFrame          = 100,
            },

            -- ����
            {
                AICheckFrame        = 21,
                AIFunc              = "Gargoyle_Check_Attack02",
                DelayFrame          = 211,
            },

            -- ��ȭ �극��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_Attack03",
                DelayFrame          = 222,
            },
            -- ��ȭ �극��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyleg_Check_Attack04",
                DelayFrame          = 222,
            },
            -- ��ȭ �극��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyleg_Check_Attack05",
                DelayFrame          = 222,
            },
        },
    },

    -- �����̵�
    {
        ID      = "MOVE_UP",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_MoveUpFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- Ÿ������
            {
                AICheckFrame        = 165,
                AIFunc              = "Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- �Ʒ����̵� ��
            {
                AICheckFrame        = 41,
                AIFunc              = "Gargoyle_Check_MoveDownLeft",
                DelayFrame          = 40,
            },
            -- �Ʒ����̵� ��
            {
                AICheckFrame        = 40,
                AIFunc              = "Gargoyle_Check_MoveDownRight",
                DelayFrame          = 41,
            },

            

            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Attack01",
                DelayFrame          = 100,
            },

            -- ����
            {
                AICheckFrame        = 21,
                AIFunc              = "Gargoyle_Check_Attack02",
                DelayFrame          = 211,
            },

            -- ��ȭ �극��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_Attack03",
                DelayFrame          = 222,
            },
        }
    },
    
    -- �Ʒ����̵� ��
    {
        ID      = "MOVE_DOWN_LEFT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_MoveDownLeftFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- Ÿ������
            {
                AICheckFrame        = 165,
                AIFunc              = "Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- �����̵�
            {
                AICheckFrame        = 30,
                AIFunc              = "Gargoyle_Check_MoveUp",
                DelayFrame          = 30,
            },

            -- �Ʒ����̵� ��
            {
                AICheckFrame        = 40,
                AIFunc              = "Gargoyle_Check_MoveDownRight",
                DelayFrame          = 41,
            },

            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Attack01",
                DelayFrame          = 100,
            },

            -- ����
            {
                AICheckFrame        = 21,
                AIFunc              = "Gargoyle_Check_Attack02",
                DelayFrame          = 211,
            },

            -- ��ȭ �극��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_Attack03",
                DelayFrame          = 222,
            },
        }
    },
    
     -- �Ʒ����̵� ��
    {
        ID      = "MOVE_DOWN_RIGHT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_MoveDownRightFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 150,
            },

            -- Ÿ������
            {
                AICheckFrame        = 165,
                AIFunc              = "Gargoyle_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_TurnToTarget",
                DelayFrame          = 44,
            },

            -- �����̵�
            {
                AICheckFrame        = 30,
                AIFunc              = "Gargoyle_Check_MoveUp",
                DelayFrame          = 30,
            },
            -- �Ʒ����̵� ��
            {
                AICheckFrame        = 41,
                AIFunc              = "Gargoyle_Check_MoveDownLeft",
                DelayFrame          = 40,
            },


            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "Gargoyle_Check_Attack01",
                DelayFrame          = 100,
            },

            -- ����
            {
                AICheckFrame        = 21,
                AIFunc              = "Gargoyle_Check_Attack02",
                DelayFrame          = 211,
            },

            -- ��ȭ �극��
            {
                AICheckFrame        = 22,
                AIFunc              = "Gargoyle_Check_Attack03",
                DelayFrame          = 222,
            },
        }
    },
    
    -- �������ֱ�
    {
        ID      = "IDLE",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_IdleFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 45,
                AIFunc              = "Gargoyle_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },

    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Gargoyle_Attack01.frm",
        Func    = "Gargoyle_Attack01Func",
    },
    
    -- ���а���02
    {
        ID      = "ATTACK02",
        Motion  = "Gargoyle_Attack02.frm",
        Func    = "Gargoyle_Attack02Func",
    },
    
    -- ���а���02
    {
        ID      = "ATTACK03",
        Motion  = "Gargoyle_Attack03.frm",
        Func    = "Gargoyle_Attack03Func",
    },
    
    {
        ID      = "ATTACK04",
        Motion  = "gunt_attack01.frm",
        Func    = "Gargoyleg_Attack04Func",
    },
    
    {
        ID      = "ATTACK05",
        Motion  = "gunt_attack02.frm",
        Func    = "Gargoyleg_Attack05Func",
    },
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "Gargoyle_damage.frm",
        Func    = "Gargoyle_DamageFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Gargoyle_die01.frm",
        Func    = "Gargoyle_DieFunc",
    },
    
    -- �ױ�����
    {
        ID      = "DIE_LANDING",
        Motion  = "Gargoyle_Die02.frm",
        Func    = "Gargoyle_DieLandingFunc",
    },
    
    -- ����
    {
        ID      = "SUMMON",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_SummonFunc",
    },
    
    
    -- ��ȭ 
    {
        ID      = "STONETOWAIT",
        Motion  = "Gargoyle_Change_wait.frm",
        Func    = "Gargoyle_StoneToWaitFunc",
    },
    
    {
        ID      = "STUN",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "Gargoyle_StunFunc",
    },
}

CallBack =
{
    Land    = "OnGargoyle_Land",
    Die     = "OnGargoyle_Die",
    Damage  = "OnGargoyle_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitGargoyleg( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )

    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    
    --pMonster:SetPushBoundBox( false )
    pMonster:SetFly( true )
    pMonster:SetCountValue( pMonster:GetHP() - 700 )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Gargoyle_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ��� ����
function Gargoyle_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame == 3 ) then
		pMonster:AddParticle( "Pariot_Summon_01" )
		pMonster:AddParticle( "Pariot_Summon_02" )
		pMonster:AddParticle( "Pariot_Summon_03" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ��� ����
function Gargoyle_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:InitTimer()
		pMonster:StartTimer()
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetTimer() > 275 ) then
			pMonster:SetState( "WAIT" )
			pMonster:InitTimer()
		else
			pMonster:SetFrameLock( true )
		end
    end
end

-- ���γ��� ����
function Gargoyle_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	pMonster:SetSpeedY( 0.012 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_UP" )
    end
end

-- �Ʒ��γ��� �� ����
function Gargoyle_MoveDownLeftFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedX( -0.012 )
	pMonster:SetSpeedY( -0.004 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN_LEFT" )
    end
end

-- �Ʒ��γ��� �� ����
function Gargoyle_MoveDownRightFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedX( 0.012 )
	pMonster:SetSpeedY( -0.004 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN_RIGHT" )
    end
end

-- �������ֱ� ����
function Gargoyle_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "IDLE" )
    end
end

-- �ױ����
function Gargoyle_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ױ���������
function Gargoyle_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 986035 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Gargoyle_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 19.0 / 20.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() * 19.0 / 20.0 )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Gargoyle_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then
		pMonster:StartAttack( 9, PAR_DOWN, 0.3, 42, 42, 4)
		pMonster:PlaySound(995038)
	--elseif( iFrame == 52 ) then
	--	pMonster:EndAttack()
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���а��� 02 ����
function Gargoyle_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 58 ) then
		pMonster:AddDamage(DT_GARGOYLE_DASHATK)
	elseif( iFrame == 62 ) then
		pMonster:PlaySound(995039)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 
function Gargoyle_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then
		pMonster:AddDamage(DT_GARGOYLE_STONEBREATH)
    elseif( iFrame == 55 ) then
		pMonster:PlaySound(995040)
		local posx = 0.24
		local posy = 0.27
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Gargoyle_Breath_01" , posx, posy )
		else
			pMonster:AddParticleNoDirection("Gargoyle_Breath_01_R" , -posx, posy )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Gargoyleg_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then
		pMonster:StartAttack( 9, PAR_SMALL_DAMAGE, 0.3, 20, 20, 4)
	elseif( iFrame == 70 ) then
		pMonster:StartAttack( 9, PAR_SMALL_DAMAGE, 0.3, 12, 12, 4)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


function Gargoyleg_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 78 ) then
		pMonster:StartAttack( 9, PAR_SMALL_DAMAGE, 0.3, 20, 20, 4)
	elseif( iFrame == 98 ) then
		pMonster:StartAttack( 9, PAR_SMALL_DAMAGE, 0.3, 12, 12, 4)
	elseif( iFrame == 172 ) then
		pMonster:StartAttack( 9, PAR_DOWN, 0.3, 42, 42, 4)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Gargoyle_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -400, 200, 400, -250 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Gargoyle_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -500, 400, 500, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Gargoyle_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Gargoyle_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetY() < pMonster:GetTargetY() + 0.21 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_UP" )
        pMonster:ResetDelay()
    end
end

function Gargoyle_Check_MoveDownLeft( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.21 and pMonster:GetX() > pMonster:GetTargetX() ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_DOWN_LEFT" )
        pMonster:ResetDelay()
    end
end

function Gargoyle_Check_MoveDownRight( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.21 and pMonster:GetX() < pMonster:GetTargetX() ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_DOWN_RIGHT" )
        pMonster:ResetDelay()
    end
end

function Gargoyle_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Gargoyle_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 50, 100, -200 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Gargoyle_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 350, -350, 100, 350, -150 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Gargoyle_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -150, 50, 140, -250 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Gargoyleg_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -150, 50, 140, -250 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end


function Gargoyleg_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -150, 50, 140, -250 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end
function Gargoyle_Check_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -400, 300, 400, -360 ) == true ) then
		if ( pMonster:FloatRand() < 0.75 ) then
			pMonster:SetState( "STONETOWAIT" )
	    	pMonster:ResetDelay()
		end
	end
end


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnGargoyle_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "DIE" ) == true ) then
        pMonster:SetState( "DIE_LANDING" )
    elseif( pMonster:CheckState( "TOSTONE_R" ) == true or pMonster:CheckState( "TOSTONE_L" ) == true or pMonster:CheckState( "STONETOWAIT" ) == true ) then
		pMonster:SetSpeedY( 0.0 )
    end
end

function OnGargoyle_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetPushCheck( false )
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact( 15 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.02 )
		pMonster:SetState( "DIE" )
	end	
end

function OnGargoyle_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetNoCheckContact( 550 )
	
	--pMonster:SetSpeedX( (pMonster:GetSpeedX() )
	pMonster:SetSpeedY( (pMonster:GetSpeedY() * 1.0) / 3.0 )
	--pMonster:SetSpeedX( 0.0 )
	--pMonster:SetSpeedY( 0.0 )
	
	if ( pMonster:FloatRand() < 0.1 and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then	
	
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		
		if ( pMonster:FloatRand() < 0.2 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK01" )	
		else
			pMonster:SetState( "ATTACK02" )	
		end
	end
	
	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end
