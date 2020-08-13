-- AI_Giant.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Giant_Wait.frm",
        Func    = "Giant_WaitFunc",

        Trigger =
        {
			-- Ÿ����
			{
				AICheckFrame	= 25,
				AIFunc			= "Giant_Check_Targeting",
				DelayFrame		= 110,
			},

            -- ����ũ~
            {
                AICheckFrame        = 400,
                AIFunc              = "Giant_Check_Attack01",
                DelayFrame          = 120,
            },

            -- ��ȭ�� �� ��
            {
                AICheckFrame        = 200,
                AIFunc              = "Giant_Check_Attack02_UP",
                DelayFrame          = 200,
            },

            -- ��ȭ�� �� ��
            {
                AICheckFrame        = 400,
				AICheckFrame1       = 300,
				AICheckFrame2       = 200,
				AICheckFrame3       = 200,
                AIFunc              = "Giant_Check_Attack02_DOWN",
                DelayFrame          = 260,
            },

            -- ��ġ��
            {
                AICheckFrame        = 110,
                AIFunc              = "Giant_Check_Attack03",
                DelayFrame          = 150,
            },

            -- �ĸ�ä ��
            {
                AICheckFrame        = 180,
				AICheckFrame1       = 120,
				AICheckFrame2       = 60,
				AICheckFrame3       = 60,
                AIFunc              = "Giant_Check_Attack04_UP",
                DelayFrame          = 370,
            },

            -- �ĸ�ä ��
            {
                AICheckFrame        = 240,
				AICheckFrame1       = 160,
				AICheckFrame2       = 80,
				AICheckFrame3       = 80,
                AIFunc              = "Giant_Check_Attack04_MIDDLE",
                DelayFrame          = 350,
            },

            -- �ĸ�ä ��
            {
                AICheckFrame        = 200,
				AICheckFrame1       = 150,
				AICheckFrame2       = 100,
				AICheckFrame3       = 100,
                AIFunc              = "Giant_Check_Attack04_DOWN",
                DelayFrame          = 330,
            },

            -- ������
            {
                AICheckFrame        = 165,
                AIFunc              = "Giant_Check_Attack05",
                DelayFrame          = 500,
				DelayFrame1			= 350,
				DelayFrame2			= 200,
				DelayFrame3			= 200,
            },

        },
    },
    
    -- ����ũ
    {
        ID      = "ATTACK01",
        Motion  = "Giant_Attack01.frm",
        Func    = "Giant_Attack01Func",
    },
    -- ��ȭ�� �� ��
    {
        ID      = "ATTACK02_UP",
        Motion  = "Giant_Attack02_Up.frm",
        Func    = "Giant_Attack02Func",
    },
    -- ��ȭ�� �� ��
    {
        ID      = "ATTACK02_DOWN",
        Motion  = "Giant_Attack02_Down.frm",
        Func    = "Giant_Attack02Func",
    },
    -- ��ġ�� ��
    {
        ID      = "ATTACK03_L",
        Motion  = "Giant_Attack03_A.frm",
        Func    = "Giant_Attack03Func",
    },
    -- ��ġ�� ����
    {
        ID      = "ATTACK03_R",
        Motion  = "Giant_Attack03_B.frm",
        Func    = "Giant_Attack03Func",
    },
    -- �ĸ�ä ��
    {
        ID      = "ATTACK04_UP",
        Motion  = "Giant_Attack04_A.frm",
        Func    = "Giant_Attack04Func",
    },
    -- �ĸ�ä ��
    {
        ID      = "ATTACK04_MIDDLE",
        Motion  = "Giant_Attack04_B.frm",
        Func    = "Giant_Attack04Func",
    },
    -- �ĸ�ä ��
    {
        ID      = "ATTACK04_DOWN",
        Motion  = "Giant_Attack04_C.frm",
        Func    = "Giant_Attack04Func",
    },
    -- ������ ������
    {
        ID      = "ATTACK05",
        Motion  = "Giant_Attack06.frm",
        Func    = "Giant_Attack05Func",
    },
    
    {
        ID                  = "DIE",
        Motion              = "Giant_Die.frm",
        Func                = "Giant_DieFunc",
    },
    
    {
        ID                  = "END",
        Motion              = "Giant_Die.frm",
        Func                = "Giant_EndFunc",
    },
}

CallBack =
{
	Die     = "OnGiant_Die",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitGiant( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetInvincible( true )
    pMonster:SetIsRight( true )
    pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( false )
    pMonster:SetFly( true )
    pMonster:SetX( 2.25 )
    pMonster:SetY( 0.3 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Giant_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	g_kCamera.WideMode = 7
	if( iFrame == 2 ) then
		if( pMonster:FloatRand() < 0.33 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 3, 0, 0, posx, -0.1 )		-- ��
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 31, 0, 0, posx, -0.1 )	-- �߸� ��
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 10, 0, 0, posx, -0.1 )	-- �Ȳ�ġ ����
		elseif( pMonster:FloatRand() < 0.66 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 27, 0, 0, posx, -0.1 )	-- �߸� ����
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 6, 0, 0, posx, -0.1 )		-- ��
		elseif( pMonster:FloatRand() < 0.99 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- �Ȳ�ġ ��
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 18, 0, 0, posx, -0.1 )	-- �ո� ��
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 19, 0, 0, posx, -0.1 )	-- �ո� ����
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Giant_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1) then
		pMonster:StartText("DANGER")
    elseif( iFrame == 67 ) then
		pMonster:PlaySound(998029)
    elseif( iFrame == 70 ) then
		pMonster:EarthQuake( 30, 0.06, 0.02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ��ȭ�� �� 
function Giant_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local posY
    
    if( iFrame <= 1) then
    elseif( iFrame == 55 ) then
		posY = 4.7
		pMonster:PlaySound(998030)
		pMonster:AddParticle("Giant_Ring_01", 0.0, posY)
		pMonster:AddParticle("Giant_Ring_02", 0.0, posY)
		pMonster:AddParticle("Giant_Ring_03", 0.0, posY)
		pMonster:AddParticle("Giant_Ring_04", 0.0, posY)
		pMonster:AddDamageWithLocate(DT_GIANT_STONE_RING, 0.0, 4.6 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ��ġ��
function Giant_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
    elseif( iFrame == 69 ) then
		pMonster:PlaySound(998029)
		pMonster:CameraVib( 0, 2.6, 0.04 )
	elseif( iFrame == 70 ) then
		if( pMonster:CheckState( "ATTACK03_L" ) == true ) then
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -1.40, 4.5)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -1.00, 5.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -1.60, 5.4)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -0.20, 5.6)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -1.76, 5.9)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -0.90, 6.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -1.40, 6.3)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -0.30, 6.6)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -2.00, 7.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -0.00, 7.5)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, -0.55, 4.9)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, -1.70, 8.0)
			pMonster:AddTraceParticleToBone( "Giant_Clap_Wall_01", 1.0, 14, 0, 0, 0.0, 0.0 )
		else
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 1.40, 4.5)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 1.00, 5.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 1.60, 5.4)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 0.20, 5.6)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 1.76, 5.9)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 0.90, 6.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 1.40, 6.3)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 0.30, 6.6)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 2.00, 7.1)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 0.00, 7.5)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE, 0.55, 4.9)
			pMonster:AddDamageWithLocate( DT_GAINT_FALLING_STONE_2, 1.70, 8.0)
			pMonster:AddTraceParticleToBone( "Giant_Clap_Wall_01", 1.0, 23, 0, 0, 0.0, 0.0 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ĸ�ä
function Giant_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
	elseif( iFrame == 65 ) then
		pMonster:StartAttack( 9, PAR_FRONTDOWN_1, 1.5, 13, 13, 18)
		pMonster:StartAttack( 9, PAR_FRONTDOWN_1, 1.5, 22, 22, 18)
	elseif( iFrame == 82 ) then
		pMonster:EndAttack()
    elseif( iFrame == 67 ) then
		pMonster:PlaySound(998031)
		if( pMonster:CheckState( "ATTACK04_UP" ) == true ) then
			posY = 6.2
		elseif( pMonster:CheckState( "ATTACK04_MIDDLE" ) == true ) then
			posY = 4.7
		else
			posY = 3.1
		end
		pMonster:AddParticle("Giant_Clap_01", 0.0, posY)
		pMonster:AddParticle("Giant_Clap_02", 0.0, posY)
		pMonster:AddParticle("Giant_Clap_03", 0.0, posY)
		pMonster:AddParticle("Giant_Clap_04", 0.0, posY)
		pMonster:AddParticle("Giant_Clap_05", 0.0, posY)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ������
function Giant_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local posY
    local angle
    if( iFrame <= 1) then
    elseif( iFrame == 50 ) then
		posY = 5.85
		pMonster:PlaySound(998033)
		pMonster:AddParticle("Giant_Beam_01", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_02", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_03", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_04", 0.0, posY)
		pMonster:ComputeAngleToTarget( 0.0, 5.85 ) -- Ÿ�������� ������ ���
	elseif( iFrame == 51 ) then
		angle = pMonster:GetAngleToTarget()
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			angle = angle * -1.0 + 3.141592
		end
		pMonster:AddDamageWithLocateAngle( DT_GIANT_LASER_BEAM, 0.0, 5.85, false, angle )
	elseif( iFrame == 70 ) then
		posY = 5.85
		pMonster:PlaySound(998033)
		pMonster:AddParticle("Giant_Beam_01", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_02", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_03", 0.0, posY)
		pMonster:AddParticle("Giant_Beam_04", 0.0, posY)
	elseif( iFrame == 71 ) then
		pMonster:SetTarget( 0, -2024, 2000, 2024, -800 )
		pMonster:ComputeAngleToTarget( 0.0, 5.85 ) -- Ÿ�������� ������ ���
		angle = pMonster:GetAngleToTarget()
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			angle = angle * -1.0 + 3.141592
		end
		pMonster:AddDamageWithLocateAngle( DT_GIANT_LASER_BEAM, 0.0, 5.85, false, angle )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �׾���
function Giant_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(998020)
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 3, 0, 0, posx, -0.1 )		-- ��
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- ��
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- �Ȳ�ġ ��
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 10, 0, 0, posx, -0.1 )	-- �Ȳ�ġ ����
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 18, 0, 0, posx, -0.1 )	-- �ո� ��
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 19, 0, 0, posx, -0.1 )	-- �ո� ����
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 31, 0, 0, posx, -0.1 )	-- �߸� ��
		pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 27, 0, 0, posx, -0.1 )	-- �߸� ����
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
        pMonster:SetFrameLock( true )
    end
end

--  �׾���
function Giant_EndFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetY(0.0)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------
function Giant_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -2024, 2000, 2024, -800 ) == true ) then
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	pMonster:SetState( "ATTACK01" )
	pMonster:ResetDelay()
end

function Giant_Check_Attack02_UP( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -800, 900, 800, -100, 2100 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack02_DOWN( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -800, 2000, 800, 1000, 0 ) == true ) then
		pMonster:SetState( "ATTACK02_DOWN" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( -900, -600, 2500, 600, 1000, 0 ) == true ) then
		pMonster:SetState( "ATTACK03_L" )
		pMonster:ResetDelay()
	elseif( pMonster:CheckTargetInRange( 900, -600, 2500, 600, 1000, 0 ) == true ) then
		pMonster:SetState( "ATTACK03_R" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack04_UP( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -900, 500, 900, -100, 2200 ) == true ) then
		pMonster:SetState( "ATTACK04_UP" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack04_MIDDLE( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -700, 700, 700, -100, 1600 ) == true ) then
		pMonster:SetState( "ATTACK04_MIDDLE" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack04_DOWN( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -900, 400, 900, -100, 1100 ) == true ) then
		pMonster:SetState( "ATTACK04_DOWN" )
		pMonster:ResetDelay()
	end
end

function Giant_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:SetTarget( 0, -2024, 2500, 2024, -800 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnGiant_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetState( "DIE" )
end

function OnGiant_End( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetState( "END" )
end
