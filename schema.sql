-- Memoria Agéntica Inmutable para K-TRACE VALENTINA
CREATE TABLE IF NOT EXISTS forensic_memory (
    evidence_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    case_id STRING NOT NULL,
    timestamp TIMESTAMPTZ DEFAULT now(),
    
    -- Datos del Sensor (Híbrido Grafeno/MXene)
    material_signature STRING, -- Ej: 'Ti3C2Tx-Graphene Hybrid'
    plasma_energy_level FLOAT,
    
    -- Representación Topológica de 11 Dimensiones
    -- Almacenamos los 'cliques' y cavidades como un objeto JSONB para flexibilidad
    topology_11d JSONB NOT NULL, 
    
    -- Cadena de Custodia (Hash Sintergial)
    integrity_hash STRING NOT NULL,
    agent_id STRING DEFAULT 'VALENTINA_OMEGA_CORE',
    
    INDEX (case_id),
    INDEX (timestamp)
);

-- Tabla para el Módulo 49: KLARIXA STEM (Log de Razonamiento Científico)
CREATE TABLE IF NOT EXISTS stem_reasoning_log (
    log_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    evidence_id UUID REFERENCES forensic_memory(evidence_id),
    slm_module STRING, -- El sub-cerebro utilizado (Física, Química, Lógica)
    riemann_resonance_freq FLOAT, -- Frecuencia de sintonía para el análisis
    analysis_result TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);
